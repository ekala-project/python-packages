{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  astor,
  dill,
  filelock,

  # tests
  pythonAtLeast,
}:

buildPythonPackage rec {
  pname = "depyf";
  version = "0.20.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "thuml";
    repo = "depyf";
    tag = "v${version}";
    hash = "sha256-GFNlJeD7Nyxr7Ya3aSA6+0AZJSaeDyqXYPEsvhPN1wg=";
  };

  # don't try to read git commit
  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail 'commit_id = get_git_commit_id()' 'commit_id = None'
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    astor
    dill
    filelock
  ];
  # All remaining tests fail with:
  # ValueError: invalid literal for int() with base 10: 'L1'
  doCheck = !(pythonAtLeast "3.13");

  pythonImportsCheck = [ "depyf" ];

  meta = {
    description = "Decompile python functions, from bytecode to source code";
    homepage = "https://github.com/thuml/depyf";
    license = lib.licenses.mit;
  };
}
