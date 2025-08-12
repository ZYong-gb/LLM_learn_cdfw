#！/bin/bash


curl http://localhost:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
        "model": "/root/model/Qwen/Qwen3-8B",
        "messages": [
          {"role": "user", "content": "你好，你是谁？"}
        ]
      }'
