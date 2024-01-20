const initial = 0;
const final = 4500;
const increment = 250;

const exceljs = require('exceljs');
const path = require('path');

let workbook = new exceljs.Workbook();
let worksheet = workbook.addWorksheet('ASA');

const filePath = path.join(__dirname, 'teste.xlsx');

worksheet.columns = [
    {  header: 'O' },
    { header: 'Mediana' },
    { header: 'Desvio Mínimo' },
    { header: 'Desvio Máximo' },
    { header: 'Minimo' },
    { header: 'Máximo' },
];

let excel_rows = AddRows();
worksheet.addRows(excel_rows);

workbook.xlsx.writeFile(filePath).then(() => {
  console.log(`Arquivo Excel criado e salvo em: ${filePath}`);
}).catch((err) => {
  console.error('Erro ao criar e salvar o arquivo Excel:', err);
});

function AddRows(){
    let rows = [];
    for(i = initial; i <= final; i += increment) {
        let json = require(`./testes/out/t${i}.json`);
        let mediana = json.results[0].median
        let min = json.results[0].min
        let max = json.results[0].max

                  
        rows.push(
          // O atual       |       Mediana
          [  getO(i)       ,       mediana, 
          // Desvio Mínimo |       Desvio Máximo
             mediana - min ,       max - mediana,  
          // Minimo        |       Máximo
             min           ,       max])
    }
    return rows
}

// Esta função é de exemplo para O(n^3)
function getO(i) {
  return i*i*i
}