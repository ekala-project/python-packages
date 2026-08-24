{ lib
, buildPythonPackage
, fetchFromGitHub
, cffi
, packaging
, R
, setuptools
, setuptools-scm
, six
,
}:

buildPythonPackage rec {
  pname = "rchitect";
  version = "0.4.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "randy3k";
    repo = "rchitect";
    tag = "v${version}";
    hash = "sha256-CTXvca687RL1aFxf7jptcNIKPUcugzFdVTSyApcaWS4=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace '"pytest-runner"' ""
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [
    cffi
    six
    packaging
  ];
  pythonImportsCheck = [ "rchitect" ];

  meta = {
    description = "Interoperate R with Python";
    homepage = "https://github.com/randy3k/rchitect";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
