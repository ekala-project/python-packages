{
  lib,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  jmespath,
}:

buildPythonPackage (finalAttrs: {
  pname = "aliyun-python-sdk-core";
  version = "2.16.1";
  format = "wheel";

  # 2.16.1 was only published as a wheel on PyPI
  src = fetchPypi {
    pname = "aliyun_python_sdk_core";
    inherit (finalAttrs) version;
    format = "wheel";
    python = "py3";
    dist = "py3";
    hash = "sha256-DyWm6Oweopx2YQJ4z/gcv/hRSabmkr8jmKb5t35edCQ=";
  };

  pythonRelaxDeps = true;

  dependencies = [
    cryptography
    jmespath
  ];

  # All components are stored in a mono repo

  pythonImportsCheck = [ "aliyunsdkcore" ];

  meta = {
    description = "Core module of Aliyun Python SDK";
    homepage = "https://github.com/aliyun/aliyun-openapi-python-sdk";
    license = lib.licenses.asl20;
  };
})
