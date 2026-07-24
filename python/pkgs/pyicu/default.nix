{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitLab,
  pkg-config,
  setuptools,
  six,
  icu,
}:

buildPythonPackage rec {
  pname = "pyicu";
  version = "2.16.2";
  pyproject = true;

  src = fetchFromGitLab {
    domain = "gitlab.pyicu.org";
    owner = "main";
    repo = "pyicu";
    tag = "v${version}";
    hash = "sha256-JCevXAL6+G+EXx4ikOANgFiI9YPhjY5fDFLFBmEs8Ro=";
  };

  postPatch = ''
    substituteInPlace setup.py --replace-fail "'pkg-config'" "'${stdenv.cc.targetPrefix}pkg-config'"
  '';

  build-system = [ setuptools ];

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ icu ];
  pythonImportsCheck = [ "icu" ];

  meta = {
    homepage = "https://gitlab.pyicu.org/main/pyicu";
    description = "Python extension wrapping the ICU C++ API";
    license = lib.licenses.mit;
  };
}
