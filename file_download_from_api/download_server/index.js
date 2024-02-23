const express = require('express');
const cors = require('cors');
const fs = require('fs');

const app = express();

app.use(cors());

const port = 5001;

app.get('/api/download', (req, res) => {
    const requestedFileType = req.query.type;
    if (requestedFileType === 'pdf') {
        const pdfFilename = 'amazing_report.pdf';
        const pdfFilePath = __dirname + '/' + pdfFilename;

        fs.readFile(pdfFilePath, (err, pdfData) => {
            res.setHeader('Content-Type', 'application/pdf');
            res.setHeader('Content-Disposition', `attachment; filename="${pdfFilename}"`);
            res.send(pdfData);
        });

    } else if (requestedFileType === 'excel') {
        const excelFilename = 'amazing_analysis_sheet.xlsx';
        const excelFilePath = __dirname + '/' + excelFilename;

        fs.readFile(excelFilePath, (err, excelData) => {
            res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            res.setHeader('Content-Disposition', `attachment; filename="${excelFilename}"`);
            res.send(excelData);
        });

    } else {
        res.status(400).send('Invalid type specified');
    }
});

app.listen(port, () => {
    console.log(`Sample API server listening on port ${port}`);
});