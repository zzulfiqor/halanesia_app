class CheckModel{
  bool isSelected;
  String title;

  CheckModel(this.isSelected, this.title);
}

List<CheckModel> dayData = [
  CheckModel(false, 'Senin'),
  CheckModel(false, 'Selasa'),
  CheckModel(false, 'Rabu'),
  CheckModel(false, 'Kamis'),
  CheckModel(false, 'Jumat'),
  CheckModel(false, 'Sabtu'),
  CheckModel(false, 'Minggu')
];