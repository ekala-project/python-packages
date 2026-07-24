{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "strenum";
  version = "0.4.15";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "irgeek";
    repo = "StrEnum";
    tag = "v${version}";
    hash = "sha256-LrDLIWiV/zIbl7CwKh7DAy4LoLyY7+hfUu8nqduclnA=";
  };

  patches = [
    (fetchpatch {
      name = "replace-safeconfigparser.patch";
      url = "https://github.com/irgeek/StrEnum/commit/896bef1b7e4a50c8b53d90c8d2fb5c0164f08ecd.patch";
      hash = "sha256-dmmEzhy17huclo1wOubpBUDc2L7vqEU5b/6a5loM47A=";
    })
  ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace '"pytest-runner"' ""
    substituteInPlace pytest.ini \
      --replace " --cov=strenum --cov-report term-missing --black --pylint" ""
  '';

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "strenum" ];

  meta = {
    description = "Module for enum that inherits from str";
    homepage = "https://github.com/irgeek/StrEnum";
    license = lib.licenses.mit;
  };
}
