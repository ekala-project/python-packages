{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "html2text";
  version = "2025.4.15";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lIpkX48Lw6vn/VhwGaIZehJDbNc9DUkIr5W/yNozdYg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  doCheck = false;

  pythonImportsCheck = [ "html2text" ];

  meta = {
    homepage = "https://github.com/Alir3z4/html2text/";
    description = "Turn HTML into equivalent Markdown-structured text";
    mainProgram = "html2text";
    license = lib.licenses.gpl3Only;
  };
}
