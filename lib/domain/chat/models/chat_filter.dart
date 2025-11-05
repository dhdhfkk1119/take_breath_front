enum ChatFilter {
  all('전체'),
  unread('안 읽음');

  const ChatFilter(this.label);
  final String label;
}