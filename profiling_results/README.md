TODOS OS EXPERIMENTOS FUNCIONANDO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

=======================================================================================================
1)Gerar arquivos .txt 'report-' executando './commands_with_slow_inputs.sh'

2)Para unir todos os arquivos 'report-*' em um único arquivo .txt: `find Experimentos/ -type f -name 'report-*' -exec sh -c 'echo "=== {} ==="; cat {}' \; >> combined_reports.txt`

3)Em seguida executar: `python combined_reports2txt_table.py`. A tabela com os resultados estará disponível no arquivo `final.txt`