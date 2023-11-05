import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GPT {
  final String apiKey;

  GPT(this.apiKey);

  Future<Map<String, dynamic>> getChatCompletion(
      List<Map<String, String>> messages) async {
    final endpoint = 'https://api.openai.com/v1/chat/completions';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    };
    final body = {'model': 'gpt-3.5-turbo', 'messages': messages};

    final response = await http.post(Uri.parse(endpoint),
        headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get chat completion: ${response.statusCode}');
    }
  }
}

void main() async {
  final apiKey = 'YOUR_OPENAI_API_KEY';
  final gpt = GPT(apiKey);
  final messages = [
    {
      "role": "system",
      "content":
          "userin bahsettiği projeyi yapmak için hangi alanda çalışanlara ihtiyacı olduğunu ve çalışanın kaç gün çalışması gerektiğini yaz. sadece alan ve süre yazsın"
    }
  ];

  String message = 'basla';

  do {
    stdout.write('User: ');
    message = stdin.readLineSync()!;

    if (message.toLowerCase() == 'çık') {
      break;
    }

    if (message.isNotEmpty) {
      messages.add({"role": "user", "content": message});
      final chat = await gpt.getChatCompletion(messages);

      final reply = chat['choices'][0]['message']['content'];
      print('ChatGPT: $reply');
      messages.add({"role": "assistant", "content": reply});

      final tokenCount = chat['usage']['total_tokens'];
      print('Total tokens used: $tokenCount');

      // Assuming the cost per token is 0.002 USD and the exchange rate is 28.40 (you may adjust these values)
      final ucret = (tokenCount / 1000) * 0.002 * 28.40;
      print('$ucret TL');
    }
  } while (true);
}
