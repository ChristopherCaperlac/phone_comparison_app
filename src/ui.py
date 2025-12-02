import sys
from PySide6 import QtCore, QtGui
from PySide6.QtCore import QSize, Qt
from PySide6.QtWidgets import (
    QApplication, 
    QMainWindow, 
    QLabel,
    QPushButton,
    QVBoxLayout,
    QHBoxLayout,
    QGridLayout,
    QTableView,
    QWidget
)


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
            # .row() indexes into the outer list, .column() indexes into the sub-list
            return self._data[index.row()][index.column()]

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
        self.setFixedSize(QSize(700,700))
        mainLayout = QHBoxLayout()
        mainLayout.setContentsMargins(10,10,10,10)

        #add filters section
        filtersLayout = QVBoxLayout()
        filtersLabel = QLabel("Filters")
        fl1 = QLabel("option 1")
        fl2 = QLabel("option 2")
        filtersLayout.addWidget(filtersLabel)
        filtersLayout.addWidget(fl1)
        filtersLayout.addWidget(fl2)

        #add table!!!!
        self.table = QTableView()
        data = [
          [4, 9, 2],
          [1, 'hello', 0],
          [3.1415, 5, 0],
          [3, 3, 2],
          [7, -8, 9],
        ]
        self.model = TableModel(data)
        self.table.setModel(self.model)

        #add test button for opening new windows
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