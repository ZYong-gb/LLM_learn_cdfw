
curl --request POST \
  --url https://api.siliconflow.cn/v1/chat/completions \
  --header 'Authorization: Bearer sk-jbvmckjzulpmliivjspnjictnxquzfxedyaxvoovvdjwotjb' \
  --header 'Content-Type: application/json' \
  --data '{
  "model": "deepseek-ai/DeepSeek-R1",
  "max_tokens": 512,
  "enable_thinking": true,
  "thinking_budget": 4096,
  "min_p": 0.05,
  "temperature": 0.7,
  "top_p": 0.7,
  "top_k": 50,
  "frequency_penalty": 0.5,
  "n": 1,
  "stream": false,
  "messages": [
    {
      "content": "你是谁",
      "role": "user"
    }
  ]
}'

# 东来api