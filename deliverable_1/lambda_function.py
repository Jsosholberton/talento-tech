import json

def lambda_handler(event, context):
    name = event.get('name', 'Guest')
    message = f"Hello {name}, your request was processed successfully."
    return {
        'statusCode': 200,
        'body': json.dumps(message)
    }
