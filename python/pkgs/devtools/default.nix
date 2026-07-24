{
  lib,
  asttokens,
  buildPythonPackage,
  executing,
  hatchling,
  fetchFromGitHub,
  pygments,
  pytest-mock,
}:

buildPythonPackage rec {
  pname = "devtools";
  version = "0.12.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "samuelcolvin";
    repo = "python-${pname}";
    tag = "v${version}";
    hash = "sha256-1HFbNswdKa/9cQX0Gf6lLW1V5Kt/N4X6/5kQDdzp1Wo=";
  };

  patches = [
    # https://github.com/samuelcolvin/python-devtools/pull/166
    ./fix-test-ast-expr.patch
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'asttokens>=2.0.0,<3.0.0' 'asttokens>=2.0.0'
  '';

  build-system = [ hatchling ];

  dependencies = [
    asttokens
    executing
    pygments
  ];
  pythonImportsCheck = [ "devtools" ];

  meta = {
    description = "Python's missing debug print command and other development tools";
    homepage = "https://python-devtools.helpmanual.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
