{ lib
, buildPythonPackage
, fetchPypi
, jupyter-packaging
, setuptools
, jupyter-server
,
}:

buildPythonPackage rec {
  pname = "jupyter-server-mathjax";
  version = "0.2.6";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "jupyter_server_mathjax";
    hash = "sha256-ux5rbcBobB/jhqIrWIYWPbVIiTqZwoEMNjmenEyiOUM=";
  };

  nativeBuildInputs = [
    jupyter-packaging
    setuptools
  ];

  propagatedBuildInputs = [ jupyter-server ];

  pythonImportsCheck = [ "jupyter_server_mathjax" ];

  meta = {
    description = "MathJax resources as a Jupyter Server Extension";
    homepage = "https://github.com/jupyter-server/jupyter_server_mathjax";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
