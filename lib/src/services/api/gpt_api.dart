part of services;

@RestApi(baseUrl: '')
abstract class GptApiService {
  factory GptApiService() => _GptApiService(Api.client);

  @POST('/completions')
  Future<ChatGptCompletionResponse> messageCompletion(
    @Body() ChatGPTCompletionRequest request,
  );
}
