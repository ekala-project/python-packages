{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  jupyter-server,
}:

buildPythonPackage rec {
  pname = "notebook-shim";
  version = "0.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyter";
    repo = "notebook_shim";
    tag = "v${version}";
    hash = "sha256-CWnXOKE1xvr+a/qWNY6XCTB5+G/fg2O/glgeLzYD+Zc=";
  };

  nativeBuildInputs = [ hatchling ];
  propagatedBuildInputs = [ jupyter-server ];
  # TODO: understand & possibly fix why tests fail. On github most testfiles
  # have been committed with msgs "wip" though.
  pythonImportsCheck = [ "notebook_shim" ];

  meta = {
    description = "Switch frontends to Jupyter Server";
    longDescription = ''
      This project provides a way for JupyterLab and other frontends to switch
      to Jupyter Server for their Python Web application backend.
    '';
    homepage = "https://github.com/jupyter/notebook_shim";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
