from openai import OpenAI
client = OpenAI(
    base_url="http://localhost:8000/v1",
    api_key="empty"
)


while True:
    problem = input("请输入你的问题：\n")
    completion = client.chat.completions.create(
    model="/home/zy/data_zy_project/data_zy_0726/model/Qwen/Qwen3-32B", # 模型名称而非本地路径
    messages=[
        {"role": "user", "content": problem}
    ]
    )

    print(completion.choices[0].message)