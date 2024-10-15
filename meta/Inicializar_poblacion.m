function poblacion = Inicializar_poblacion(pop_size)

poblacion=cell(pop_size,1);
for i=1:pop_size
    poblacion{i}=rand([1 6],"double");
end

end