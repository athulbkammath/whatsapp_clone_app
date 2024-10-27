import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/chat_provider.dart';
import 'chat_list_tile.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatProvider>(context, listen: false).loadUsers();
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAppBar(),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildSearchTextField(),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: _buildChipView(),
                  )),
              _buildChatList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "WhatsApp",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.qr_code, color: Colors.black, size: 20),
                onPressed: () {},
              ),
              IconButton(
                icon:
                    const Icon(Icons.camera_alt, color: Colors.black, size: 20),
                onPressed: () {},
              ),
              IconButton(
                icon:
                    const Icon(Icons.more_vert, color: Colors.black, size: 20),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, _) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: chatProvider.users.length,
          itemBuilder: (ctx, i) => ChatListTile(
            user: chatProvider.users[i],
            hasNewMessages: i % 2 == 0,
          ),
        );
      },
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Ask Meta AI or Search',
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildChipView() {
    return Selector<ChatProvider, List<String>>(
      selector: (_, provider) => provider.chips,
      builder: (_, chips, child) => Row(
        children: chips
            .map((chip) => Selector<ChatProvider, String>(
                  selector: (_, provider) => provider.selectedChip,
                  builder: (_, selectedChip, child) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(chip),
                      selected: selectedChip == chip,
                      onSelected: (bool selected) {
                        Provider.of<ChatProvider>(context, listen: false)
                            .setSelectedChip(chip);
                      },
                      selectedColor: Colors.green[200],
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: TextStyle(
                        color: selectedChip == chip
                            ? Colors.black
                            : Colors.black87,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  void _onSearchChanged() {
    Provider.of<ChatProvider>(context, listen: false)
        .searchUsers(_searchController.text);
  }
}
