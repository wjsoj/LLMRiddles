from zhipuai import ZhipuAI
from .base import register_llm


def ask_chatglm(message: str, api_key: str):
    client = ZhipuAI(api_key=api_key)

    response = client.chat.completions.create(
        model="glm-4-air",
        messages=[{
            "role": "user",
            "content": message
        }],
        top_p=0.7,
        temperature=0.9,
    )

    response_msg = response.choices[0].message.content

    return response_msg


register_llm('chatglm', ask_chatglm)
