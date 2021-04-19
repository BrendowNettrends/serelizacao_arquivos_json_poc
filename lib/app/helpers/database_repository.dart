import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository {

  static DatabaseRepository _databaseHelper;
  static Database _database;

  String itemsTable = 'Items';
  String colIdItem = 'id_Item';
  String colTxReference = 'tx_Ref';
  String colPhoto = 'photo';
  String colTxDescription = 'tx_Description';
  String colIdInspectionCriteria = 'id_InspectionCriteria';
  String colDtDate = 'dt_Date';
  String colTxCondition = 'tx_Condition';
  String colTxComments = 'tx_Comments';
  String colBlCondition = 'bl_Condition';
  String colIdLocation = 'id_Location';
  String colNumLevel = 'num_Level';
  String colIdGrade = 'id_Grade';
  String colIdProject = 'id_Project';
  String colHowToInspect = 'HowToInspect';
  String colPrimarySecuring = 'PrimarySecuring';
  String colSecondarySecuring = 'SecondarySecuring';
  String colSafetySecuring = 'SafetySecuring';
  String colIdZone = 'id_Zone';
  String colFrequency = 'Frequency';
  String colBlClosedDefect = 'bl_ClosedDefect';

  String inspectionCriteriaTable = 'InspectionCriteria';
  String colTxItemDescription = 'tx_ItemDescription';
  String colNumFrequency = 'num_Frequency';
  String colTxHowToInspect = 'tx_HowToInspect';
  String colTxPrimarySecuring = 'tx_PrimarySecuring';
  String colTxSecondSecuring = 'tx_SecondarySecuring';
  String colTxSafetySecuring = 'tx_SafetySecuring';

  String areaTable = 'Areas';
  String colIdArea = 'id_Area';
  String colNomArea = 'nom_Area';

  String locationTable = 'Locations';
  String colNomLocation = 'nom_Location';

  String zoneTable = 'Zones';
  String colNomZone = 'nom_Zone';
  String colNomZoneDescription = 'nom_ZoneDescription';

  String gradeTable = 'Grades';
  String colTxGrade = 'tx_Grade';

  String projectTable = 'Projects';
  String colNomProject = 'nom_Project';
  String colNomClient = 'nom_Client';
  String colNomInstallation = 'nom_Installation';
  String colDtProject = 'dt_Project';

  DatabaseRepository._createInstance();

  factory DatabaseRepository() {
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseRepository._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if(_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }
  
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'dropped_objects.db';
  
    var itemsDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return itemsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    
    
    await db.execute('CREATE TABLE $itemsTable ($colIdItem INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colTxReference TEXT, $colPhoto BLOB, $colTxDescription TEXT, $colIdInspectionCriteria INTEGER, $colDtDate TEXT, $colTxCondition TEXT, $colTxComments TEXT '
        '$colBlCondition INTEGER, $colIdLocation INTEGER, $colNumLevel TEXT, $colIdGrade INTEGER, $colIdProject INTEGER, $colHowToInspect TEXT, $colPrimarySecuring TEXT '
        '$colSecondarySecuring TEXT, $colSafetySecuring TEXT, $colIdZone INTEGER, $colFrequency INTEGER, $colBlClosedDefect INTEGER)');

    await db.execute('CREATE TABLE $inspectionCriteriaTable ($colIdInspectionCriteria INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colTxItemDescription TEXT, $colNumFrequency INTEGER, $colTxHowToInspect TEXT, $colTxPrimarySecuring TEXT, $colTxSecondSecuring TEXT, $colTxSafetySecuring TEXT)');

    await db.execute('CREATE TABLE $areaTable($colIdArea INTEGER PRIMARY KEY AUTOINCREMENT, $colNomArea TEXT)');

    await db.execute('CREATE TABLE $zoneTable($colIdZone INTEGER PRIMARY KEY AUTOINCREMENT, $colIdArea INTEGER, $colNomZone TEXT)');

    await db.execute('CREATE TABLE $locationTable($colIdLocation INTEGER PRIMARY KEY AUTOINCREMENT, $colNomLocation TEXT)');

    await db.execute('CREATE TABLE $gradeTable($colIdGrade INTEGER PRIMARY KEY AUTOINCREMENT, $colTxGrade TEXT)');

    await db.execute('CREATE TABLE $projectTable($colIdProject INTEGER PRIMARY KEY AUTOINCREMENT, $colNomProject TEXT '
        '$colNomClient TEXT, $colNomInstallation TEXT, $colDtProject TEXT)');


  }

}