import sys
from PySide6 import QtCore
from PySide6.QtCore import QSize, Qt
from PySide6.QtWidgets import (
    QApplication, 
    QMainWindow, 
    QLabel,
    QPushButton,
    QVBoxLayout,
    QHBoxLayout,
    QTableView,
    QWidget
)
from database import Database

class InfoWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("!!!!put name of phone here")
        layout = QVBoxLayout()
        self.Label = QLabel("detailed info goes here")
        layout.addWidget(self.Label)
        self.setLayout(layout)

class TableModel(QtCore.QAbstractTableModel):
    def __init__(self, data):
        super().__init__()
        self._data = data
    
    def data(self, index, role):
        if role == Qt.DisplayRole:
            row_dict = self._data[index.row()]
            row_values = list(row_dict.values())
            return row_values[index.column()]
		
    def headerData(self, section, orientation, role=QtCore.Qt.DisplayRole):
        columnNames = ["Company", "Model", "Price"]
        if orientation == QtCore.Qt.Horizontal and role == QtCore.Qt.DisplayRole:
            return columnNames[section]
        return super().headerData(section, orientation, role)

    def rowCount(self, index):
        # The length of the outer list.
        return len(self._data)

    def columnCount(self, index):
        # The following takes the first sub-list, and returns
        # the length (only works if all rows are an equal length)
        return len(self._data[0])

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Phone Comparison App")
        mainLayout = QHBoxLayout()
        mainLayout.setContentsMargins(10,10,10,10)

        #add filters section
        filtersLayout = QVBoxLayout()
        filtersLabel = QLabel()
        filtersLabel.setText("<h3>Filters</h3>")
        fl1 = QLabel("option 1")
        fl2 = QLabel("option 2")
        filtersLayout.addWidget(filtersLabel)
        filtersLayout.addWidget(fl1)
        filtersLayout.addWidget(fl2)

        #add table!!
        self.table = QTableView()
        database = Database()
        data = database.fetchCompanies()
        self.model = TableModel(data)
        self.table.setModel(self.model)

        #add test button for opening new windows!!!!!!!
        infoLayout = QVBoxLayout()
        self.button = QPushButton("test")
        self.button.clicked.connect(self.showInfoWindow)
        self.button2 = QPushButton("test2")
        self.button2.clicked.connect(self.showInfoWindow)
        infoLayout.addWidget(self.button)
        infoLayout.addWidget(self.button2)

        #add elements to the main structure
        mainLayout.addLayout(filtersLayout)
        mainLayout.addWidget(self.table)
        mainLayout.addLayout(infoLayout)

        #set hbox as main layout
        mainWidget = QWidget()
        mainWidget.setLayout(mainLayout)
        self.setCentralWidget(mainWidget)
    
    def showInfoWindow(self):
        self.w = InfoWindow()
        self.w.setFixedSize(QSize(500,500))
        self.w.show()

app = QApplication(sys.argv)
window = MainWindow()
window.show()
app.exec()