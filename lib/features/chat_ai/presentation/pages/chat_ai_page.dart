import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_ai_view.dart';
import '../bloc/chat_ai_bloc.dart';
import '../../domain/usecases/chat_ai_usecase.dart';
import '../../domain/usecases/chat_ai_usecase_imp.dart';
import '../../data/repositories/chat_ai_repository_imp.dart';
import '../../../../core/services/dio_service_imp.dart';

class ChatAiPage extends StatelessWidget {
  ChatAiPage({super.key});

  final ChatAiUsecase _chatAiUsecase =
      ChatAiUsecaseImp(ChatAiRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatAiBloc(chatAiUsecase: _chatAiUsecase),
      child: const ChatAiView(),
    );
  }
}
