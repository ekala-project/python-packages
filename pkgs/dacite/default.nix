{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  pythonAtLeast,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dacite";
  version = "1.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "konradhalas";
    repo = "dacite";
    tag = "v${version}";
    hash = "sha256-mAPqWvBpkTbtzHpwtCSDXMNkoc8/hbRH3OIEeK2yStU=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace "--benchmark-autosave --benchmark-json=benchmark.json" ""
  ''
  + lib.optionalString (pythonAtLeast "3.14") ''
    substituteInPlace tests/core/test_union.py \
      --replace-fail "typing.Union[int, str]" "int | str"
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dacite" ];

  meta = {
    description = "Python helper to create data classes from dictionaries";
    homepage = "https://github.com/konradhalas/dacite";
    license = lib.licenses.mit;
  };
}
