part of models;

class ChatGPTCompletionRequest {
  ChatGPTCompletionRequest({required this.user, required this.prompt});

  final String user;
  final String prompt;

  Map<String, dynamic> toJson() => {
        'model': 'gpt-3.5-turbo-instruct',
        'prompt': prompt,
        'temperature': 0.6,
        'max_tokens': 2000,
        'user': user,
      };
}
