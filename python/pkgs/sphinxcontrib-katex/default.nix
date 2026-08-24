{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, sphinx
,
}:

buildPythonPackage rec {
  pname = "sphinxcontrib-katex";
  version = "0.9.11";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinxcontrib_katex";
    inherit version;
    hash = "sha256-LTKyENILvuRRpR0ZZF9v719VaLmlTigTr/uW76ZhI4o=";
  };

  build-system = [ setuptools ];

  dependencies = [ sphinx ];

  pythonImportsCheck = [ "sphinxcontrib.katex" ];

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Sphinx extension using KaTeX to render math in HTML";
    homepage = "https://github.com/hagenw/sphinxcontrib-katex";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
