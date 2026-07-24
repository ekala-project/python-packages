{
  lib,
  buildPythonPackage,
  fetchurl,
  hatchling,
}:

buildPythonPackage rec {
  pname = "sseclient-py";
  version = "1.9.0";
  format = "wheel";

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/4d/2e/59920f7d66b7f9932a3d83dd0ec53fab001be1e058bf582606fe414a5198/sseclient_py-${version}-py3-none-any.whl";
    hash = "sha256-NABisVh/wogIkoEeKrWxdtmO8+7pizZy/zo7oejtD28=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "sseclient" ];

  meta = {
    description = "Pure-Python Server Side Events (SSE) client";
    homepage = "https://github.com/mpetazzoni/sseclient";
    license = lib.licenses.asl20;
  };
}
