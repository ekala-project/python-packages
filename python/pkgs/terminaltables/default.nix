{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "terminaltables";
  version = "3.1.10";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-um7KXLW6ArukyfT5ha+AxU7D3M+Uz80ZAVQ4YlXkdUM=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'poetry>=0.12' 'poetry-core>=1.0.0' \
      --replace-fail 'poetry.masonry' 'poetry.core.masonry'
  '';

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "terminaltables" ];

  meta = {
    homepage = "https://github.com/Robpol86/terminaltables";
    description = "Display simple tables in terminals";
    license = lib.licenses.mit;
  };
}
