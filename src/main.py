from decimal import Decimal
import sys
from PySide6 import QtCore
from PySide6.QtCore import QSize, Qt, QModelIndex
from PySide6.QtWidgets import (
    QApplication,
    QMainWindow, 
    QLabel,
    QPushButton,
    QVBoxLayout,
    QHBoxLayout,
    QTableView,
    QWidget,
    QAbstractScrollArea,
)
from database import Database

class ChipWindow(QWidget):
    def __init__(self, chipName):
        super().__init__()
        query = f"SELECT * FROM chip WHERE modelname = '{chipName}'"
        phoneChip = database.query(query, fetch=True)[0]
        print("Phone Details: ", phoneChip)
        self.setWindowTitle(phoneChip["modelname"])
        layout = QVBoxLayout()
        for key, value in phoneChip.items():
            if isinstance(value, int) or isinstance(value, Decimal):
                value = str(value)
            if isinstance(value, list):
                value = "IP" + "".join(str(x) for x in value)
            layout.addWidget(QLabel(f"{key}: {value}"))
        self.setLayout(layout)

class PhoneWindow(QWidget):
    def __init__(self, phoneName):
        super().__init__()
        query = f"SELECT * FROM phonemodel WHERE modelname = '{phoneName}'"
        phone = database.query(query, fetch=True)[0]
        print("Phone Details: ", phone)
        self.setWindowTitle(phone["modelname"])
        layout = QVBoxLayout()
        for key, value in phone.items():
            if isinstance(value, int) or isinstance(value, Decimal):
                value = str(value)
            if isinstance(value, list):
                value = "IP" + "".join(str(x) for x in value)
            layout.addWidget(QLabel(f"{key}: {value}"))
        query = f"SELECT c_modelname FROM contains WHERE p_modelname = '{phoneName}' LIMIT 1"
        phoneChip = database.query(query, fetch=True)[0]
        chipButton = QPushButton(f"Chip: {phoneChip["c_modelname"]}")
        chipButton.clicked.connect(lambda checked, chipName=phoneChip["c_modelname"]: self.showChipWindow(chipName))
        layout.addWidget(chipButton)
        self.setLayout(layout)
    
    def showChipWindow(self, chipName):
        self.w = ChipWindow(chipName)
        self.w.setFixedSize(QSize(500,500))
        self.w.show()

class TableModel(QtCore.QAbstractTableModel):
    def __init__(self, data):
        super().__init__()
        # Data is in the format List[Dict[str,any]]
        # Each Dict is a row that follows the format {"columnName": "columnValue", ...} for each column in sql table
        self._data = data
        self.columnNames = list(self._data[0].keys())
    
    def rowCount(self, parent=QModelIndex()):
        return len(self._data)

    def columnCount(self, parent=QModelIndex()):
        return len(self._data[0])

    def data(self, index, role):
        if role == Qt.DisplayRole:
            row_dict = self._data[index.row()]
            row_values = list(row_dict.values())
            data = row_values[index.column()]
            if isinstance(data, Decimal):
                data = str(data)
            if isinstance(data, list):
                data = "IP" + "".join(str(x) for x in data)
            return data
		
    def headerData(self, section, orientation, role=QtCore.Qt.DisplayRole):
        if orientation == QtCore.Qt.Horizontal and role == QtCore.Qt.DisplayRole:
            return self.columnNames[section]
        return super().headerData(section, orientation, role)
    
    def sort(self, column: int, order: Qt.SortOrder):
        self.layoutAboutToBeChanged.emit()

        if order == Qt.AscendingOrder:
            query = "SELECT modelname, rating, price FROM phonemodel ORDER BY " + self.columnNames[column] + " ASC"
            self._data = database.query(query, fetch=True)
        else:
            query = "SELECT modelname, rating, price FROM phonemodel ORDER BY " + self.columnNames[column] + " DESC"
            self._data = database.query(query, fetch=True)

        self.layoutChanged.emit()

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Phone Comparison App")
        mainLayout = QHBoxLayout()
        mainLayout.setContentsMargins(10,10,10,10)

        #add table!!
        self.table = QTableView(sortingEnabled=True)
        data = database.fetchPhones(simplified=True)
        self.model = TableModel(data)
        self.table.setModel(self.model)
        self.table.setSizeAdjustPolicy(QAbstractScrollArea.AdjustToContents)

        self.setButtons()
        self.model.layoutChanged.connect(self.setButtons)

        mainLayout.addWidget(self.table)

        #set hbox as main layout
        mainWidget = QWidget()
        mainWidget.setLayout(mainLayout)
        self.setCentralWidget(mainWidget)
    
    def showPhoneWindow(self, phoneName):
        self.w = PhoneWindow(phoneName)
        self.w.setFixedSize(QSize(500,500))
        self.w.show()

    def setButtons(self):
        for rowIndex in range(self.model.rowCount()):

            firstCellOfRow = self.model.index(rowIndex, 0)
            data = self.model.data(firstCellOfRow, Qt.DisplayRole)

            button = QPushButton(data)
            button.clicked.connect(lambda checked, phoneName=data: self.showPhoneWindow(phoneName))
            self.table.setIndexWidget(firstCellOfRow, button)

database = Database()
app = QApplication(sys.argv)
window = MainWindow()
window.show()
app.exec()