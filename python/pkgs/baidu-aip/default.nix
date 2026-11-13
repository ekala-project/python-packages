{
  lib,
  buildPythonPackage,
  fetchPypi,
  chardet,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "baidu-aip";
  version = "4.16.13";
  format = "wheel";

  src = fetchPypi {
    pname = "baidu_aip";
    inherit (finalAttrs) version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    hash = "sha256-Y6PNN+KTV04FbDPZqaHl8y+gk4x9R6xdJO6jbnnp4/Y=";
  };

  dependencies = [
    chardet
    requests
  ];

  # Package has no tests

  pythonImportsCheck = [ "aip" ];

  meta = {
    description = "Baidu AI Platform SDK for Python";
    homepage = "https://github.com/Baidu-AIP/python-sdk";
    license = lib.licenses.asl20;
  };
})
