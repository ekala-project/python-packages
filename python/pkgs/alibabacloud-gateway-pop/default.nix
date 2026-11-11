{
  lib,
  alibabacloud-credentials,
  alibabacloud-gateway-spi,
  buildPythonPackage,
  darabonba-core,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "alibabacloud-gateway-pop";
  version = "0.1.6";
  pyproject = true;

  src = fetchPypi {
    pname = "alibabacloud_gateway_pop";
    inherit (finalAttrs) version;
    hash = "sha256-SYdX+Psa/GqpYKlBz8NikkOA17wCGxi2BCfX5VXFXr0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    alibabacloud-credentials
    alibabacloud-gateway-spi
    darabonba-core
  ];

  pythonImportsCheck = [ "alibabacloud_gateway_pop" ];

  meta = {
    description = "Alibaba Cloud POP Gateway Library for Python";
    homepage = "https://github.com/aliyun/alibabacloud-gateway";
    license = lib.licenses.asl20;
  };
})
