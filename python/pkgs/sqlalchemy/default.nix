{
  lib,
  isPyPy,
  buildPythonPackage,
  fetchFromGitHub,
  cython,
  setuptools,
  greenlet,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "sqlalchemy";
  version = "2.0.49";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sqlalchemy";
    repo = "sqlalchemy";
    tag = "rel_${lib.replaceStrings [ "." ] [ "_" ] finalAttrs.version}";
    hash = "sha256-+6g9TONKwCQWmWXHjpIDPDh96ng4lwLc1C009/l769Q=";
  };

  postPatch = ''
    sed -i '/tag_build = dev/d' setup.cfg
  '';

  build-system = [ setuptools ] ++ lib.optionals (!isPyPy) [ cython ];

  dependencies = [
    greenlet
    typing-extensions
  ];

  pythonImportsCheck = [ "sqlalchemy" ];

  meta = {
    description = "Python SQL toolkit and Object Relational Mapper";
    homepage = "http://www.sqlalchemy.org/";
    license = lib.licenses.mit;
  };
})
