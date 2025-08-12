from openai import OpenAI
client = OpenAI(
    base_url="http://localhost:8000/v1",
    api_key="empty"
)


while True:
    problem = input("请输入你的问题：\n")
    completion = client.chat.completions.create(
    model="/root/model/Qwen/Qwen3-8B", # 模型名称而非本地路径
    messages=[
        {"role": "user", "content": problem}
    ]
    )

    print(completion.choices[0].message)