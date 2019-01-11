part of tut.widgets;

class AccountPage extends Page {
  final IconData icon = OMIcons.accountCircle;
  final String title = "Account";

  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  Widget build(BuildContext context) {
    return Text("account");
  }
}