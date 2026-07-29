{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  pcpp,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "cxxheaderparser";
  version = "1.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "robotpy";
    repo = "cxxheaderparser";
    tag = version;
    hash = "sha256-l81b/M6ir3aWnycrl8RfuN3JQYkcRcTFRhejBWXGgb4=";
  };

  postPatch = ''
    # version.py is generated based on latest git tag
    echo "__version__ = '${version}'" > cxxheaderparser/version.py
  '';

  build-system = [
    hatch-vcs
    hatchling
  ];

  checkInputs = [ pcpp ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "cxxheaderparser" ];

  meta = {
    description = "Modern pure Python C++ header parser";
    homepage = "https://github.com/robotpy/cxxheaderparser";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
}
