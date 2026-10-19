{
  lib,
  buildPythonPackage,
  fetchFromGitLab,
  hatchling,
  h5py,
  numpy,
  scipy,
  xmltodict,
}:

buildPythonPackage (finalAttrs: {
  pname = "pymatreader";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitLab {
    owner = "obob";
    repo = "pymatreader";
    tag = "v${finalAttrs.version}";
    hash = "sha256-cDEGEvBSj3gmjA+8aXULwuBVk09BLQbA91CNAxgtiLA=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'source = "regex_commit"' "" \
      --replace-fail '"hatch-regex-commit"' ""
  '';

  build-system = [ hatchling ];

  dependencies = [
    h5py
    numpy
    scipy
    xmltodict
  ];

  pythonImportsCheck = [ "pymatreader" ];

  meta = {
    description = "Python package to read all kinds and all versions of Matlab mat files";
    homepage = "https://gitlab.com/obob/pymatreader/";
    license = lib.licenses.bsd2;
  };
})
