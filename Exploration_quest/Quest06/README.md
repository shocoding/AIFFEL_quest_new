## AIFFEL Campus Online Code Peer Review Templete
- 코더 : 서승호
- 리뷰어 : 이혁희


## PRT(Peer Review Template)
- [ ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 한국어 챗봇 모델은  구현되어 있지 않습니다.
    - 영어 데이터의 전처리, 학습, 질문 답변 코드를 구현하였습니다.
    ```
    # 전처리 함수
    def preprocess_sentence(sentence):
      # 입력받은 sentence를 소문자로 변경하고 양쪽 공백을 제거
      sentence = sentence.lower().strip()  # [[YOUR CODE]]

      # 단어와 구두점(punctuation) 사이의 거리를 만듭니다.
      # 예를 들어서 "I am a student." => "I am a student ."와 같이
      # student와 온점 사이에 거리를 만듭니다.
      sentence = re.sub(r"([?.!,])", r" \1 ", sentence)
      sentence = re.sub(r'[" "]+', " ", sentence)

      # (a-z, A-Z, ".", "?", "!", ",")를 제외한 모든 문자를 공백인 ' '로 대체합니다.
      sentence = re.sub(r"[^a-zA-Z?.!,]+", " ", sentence)  # [[YOUR CODE]]
      sentence = sentence.strip()
      return sentence

    print("슝=3")
    ```
    ```
    EPOCHS = 10
    model.fit(dataset, epochs=EPOCHS, verbose=1)
    ```
    ```
    sentence_generation('Where have you been?')
    ```
    
- [ ]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 주석이 잘 달려 있습니다.
        
- [ ]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 필요한 코드를 추가하여 전체 플로우를 실행해 보았습니다.
    ```
    class MultiHeadAttention(tf.keras.layers.Layer):

      def __init__(self, d_model, num_heads, name="multi_head_attention"):
        super(MultiHeadAttention, self).__init__(name=name)
        self.num_heads = num_heads
        self.d_model = d_model

        assert d_model % self.num_heads == 0

        self.depth = d_model // self.num_heads

        self.query_dense = tf.keras.layers.Dense(units=d_model)
        self.key_dense = tf.keras.layers.Dense(units=d_model)
        self.value_dense = tf.keras.layers.Dense(units=d_model)

        self.dense = tf.keras.layers.Dense(units=d_model)

      def split_heads(self, inputs, batch_size):
        inputs = tf.reshape(
            inputs, shape=(batch_size, -1, self.num_heads, self.depth))
        return tf.transpose(inputs, perm=[0, 2, 1, 3])

      def call(self, inputs):
        query, key, value, mask = inputs['query'], inputs['key'], inputs[
            'value'], inputs['mask']
        batch_size = tf.shape(query)[0]

        # Q, K, V에 각각 Dense를 적용합니다
        query = self.query_dense(query)  # [[YOUR CODE]]
        key = self.key_dense(key)  # [[YOUR CODE]]
        value = self.value_dense(value)  # [[YOUR CODE]]

        # 병렬 연산을 위한 머리를 여러 개 만듭니다
        query = self.split_heads(query, batch_size)  # [[YOUR CODE]]
        key = self.split_heads(key, batch_size)  # [[YOUR CODE]]
        value = self.split_heads(value, batch_size)  # [[YOUR CODE]]

        # 스케일드 닷 프로덕트 어텐션 함수
        scaled_attention = scaled_dot_product_attention(query, key, value, mask)

        scaled_attention = tf.transpose(scaled_attention, perm=[0, 2, 1, 3])

        # 어텐션 연산 후에 각 결과를 다시 연결(concatenate)합니다
        concat_attention = tf.reshape(scaled_attention,
                                      (batch_size, -1, self.d_model))

        # 최종 결과에도 Dense를 한 번 더 적용합니다
        outputs = self.dense(concat_attention)

        return outputs

    print("슝=3")
    ```        
- [ ]  **4. 회고를 잘 작성했나요?**
    - 회고를 작성하지 않았습니다.
        
- [ ]  **5. 코드가 간결하고 효율적인가요?**
    - 노드의 학습 내용을 바탕으로 잘 작성하였습니다.


## 참고 링크 및 코드 개선

트랜스포머 모델에서 한글 처리를 위해서 고쳐야할 부분은 다음 세 가지입니다.
모델의 정의 등은 바꾸지 않아도 잘 돌아 갑니다.

1. process_sentence함수
    - 특수 문자를 공백문자로 대체할 때 한글을 남겨 놓아야 합니다.
    ```
      # (a-z, A-Z, ".", "?", "!", ",", 한글)를 제외한 모든 문자를 공백인 ' '로 대체합니다.
      sentence = re.sub(r'[^a-zA-Z.?!,가-힣]', ' ', sentence)

    ```
2. load_conversations 함수
    - 데이터가 질문, 답변, 라벨 순으로 되어 있으므로 형식에 맞게 questions와 answers를 load하면 됩니다.
    ```
    import csv

    def load_conversations():
        file_path = '/aiffel/aiffel/transformer_chatbot/data/ChatbotData .csv'

        questions, answers, labels = [], [], []

        with open(file_path, errors = 'ignore') as file:
            reader = csv.reader(file)
            next(reader)  # 첫 번째 줄(헤더) 건너뛰기

            for row in reader:
                if len(row) != 3:  # 데이터 형식이 올바르지 않은 경우 건너뛰기
                    continue
                question, answer, label = row

                questions.append(preprocess_sentence(question))
                answers.append(preprocess_sentence(answer))
                labels.append(label)  # label은 preprocess_sentence를 적용하지 않음

        return questions, answers, labels

    questions, answers, labels = load_conversations()
    ```

3. MAX_LENGTH = 15 정도


```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
