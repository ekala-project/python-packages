{
  lib,
  buildPythonPackage,
  fetchPypi,
  python,
  cffi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "xattr";
  version = "1.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VQA2JOodSg52nYA4kt1maX+0hfGqtyad/Pq2jqW9cvQ=";
  };

  nativeBuildInputs = [
    cffi
    setuptools
  ];

  # https://github.com/xattr/xattr/issues/43

  dependencies = [ cffi ];

  postBuild = ''
    ${python.pythonOnBuildForHost.interpreter} -m compileall -f xattr
  '';

  pythonImportsCheck = [ "xattr" ];

  meta = {
    description = "Python wrapper for extended filesystem attributes";
    mainProgram = "xattr";
    homepage = "https://github.com/xattr/xattr";
    license = lib.licenses.mit;
  };
})
