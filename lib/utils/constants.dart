class Constants{
  static int invoiceNumber = 1;
  static List listInvoiceData = [];
  static String month = DateTime.now().toString().split(' ')[0].split('-')[1];
  static String day = DateTime.now().toString().split(' ')[0].split('-')[2];

  static DateTime prevMonthDate = DateTime(DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);
  static DateTime nowMonthDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  static int prevMonth = int.parse(prevMonthDate.toString().split(' ')[0].split('-')[1]);
  static int nowMonth = int.parse(nowMonthDate.toString().split(' ')[0].split('-')[1]);

  static int dd = 1;
}