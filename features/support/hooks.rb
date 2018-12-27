Before do
  @template_jwt = YAML.load_file("features/templates/post_return_jwt.yml")
  @template_jwt_error = YAML.load_file("features/templates/post_return_jwt_error.yml")
end

Before ('@usuario_correto') do
  steps %{Dado que eu esteja com o perfil de acesso a criacao
    E envie o json com os dados
    Quando realizar o post de criacao do ajuste
    Entao devo receber status 200
    E o dado deve ser gravado no banco de dados com status "NOVO"}
end