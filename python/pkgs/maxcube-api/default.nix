{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "maxcube-api";
  version = "0.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hackercowboy";
    repo = "python-${pname}";
    tag = "V${finalAttrs.version}";
    sha256 = "10k61gfpnqljf3p3qxr97xq7j67a9cr4ivd9v72hdni0znrbx6ym";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py --replace "license=license" "license='MIT'"
  '';

  nativeCheckInputs = [ pytestCheckHook ];

  disabledTests = [
    "testSendRadioMsgClosesConnectionOnErrorAndRetriesIfReusingConnection"
    "testSendRadioMsgReusesConnection"
  ];

  pythonImportsCheck = [
    "maxcube"
    "maxcube.cube"
  ];

  meta = {
    description = "eQ-3/ELV MAX! Cube Python API";
    homepage = "https://github.com/hackercowboy/python-maxcube-api";
    license = lib.licenses.mit;
  };
})
