class MyWidgetState extends State<MyWidget> {
  List<List<dynamic>> all_rec = [];

  @override
  void initState() {
    super.initState();
    fetchRecords();
  }

  Future<void> fetchRecords() async {
    // Perform async work outside setState
    List<List<dynamic>> records = await dbService.fiRead_Records(
        grade, "${Subjects[GradesSubjects[grade][index]][1]}");

    // Update state synchronously inside setState
    setState(() {
      all_rec = records;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: all_rec.isEmpty
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: all_rec.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(all_rec[index][0]),
                  subtitle: Text(all_rec[index][1]),
                );
              },
            ),
    );
  }
}
