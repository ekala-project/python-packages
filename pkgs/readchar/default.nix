{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "readchar";
  version = "4.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "magmax";
    repo = "python-readchar";
    tag = "v${finalAttrs.version}";
    hash = "sha256-r+dKGv0a7AU+Ef94AGCCJLQolLqTTxaNmqRQYkxk15s=";
  };

  postPatch = ''
    # Tags on GitHub still have a postfix (-dev0)
    sed -i 's/\(version = "\)[^"]*\(".*\)/\1${finalAttrs.version}\2/' pyproject.toml
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "readchar" ];

  doCheck = false;

  meta = {
    description = "Python library to read characters and key strokes";
    homepage = "https://github.com/magmax/python-readchar";
    license = lib.licenses.mit;
  };
})
