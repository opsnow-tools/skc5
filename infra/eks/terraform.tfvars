aws_region = "ap-northeast-2"

# 리소스 이름에 의미있는 정보를 담기위해 아래 3개의 변수를 연결하여 하나의 변수로 만들어서 사용함.
# ex) full_name = city + stage + name
city = "SEOUL"
stage = "SRE"
cluster_name = "SKC5"    # 그냥 사용해도 되지만 유니크한 이름으로 변경해도 됨

suffix = "EKS"

vpc_cidr = "10.101.0.0/16"    # 그냥 사용해도 되지만, 상황에 맞게 변경해서 사용 가능

# 그냥 사용해도 되지만, 상황에 맞게 변경해서 사용 가능
public_subnet_cidrs = [
  "10.101.35.0/24",
  "10.101.36.0/24",
  "10.101.37.0/24",
]

# 그냥 사용해도 되지만, 상황에 맞게 변경해서 사용 가능
private_subnet_cidrs = [
  "10.101.38.0/24",
  "10.101.39.0/24",
  "10.101.40.0/24",
]
sg_name = "node"
sg_desc = "Security group for all worker nodes in the cluster"             

# 그냥 사용해도 되지만, 상황에 맞게 변경해서 사용 가능
source_sg_cidrs = [
    {
        desc = "Gangnam 13F wifi",
        cidrs = ["58.151.93.9/32"], 
        from = 22,
        to = 22,
        protocol = "tcp",
        type = "ingress"
    },
]

kubernetes_version = "1.14"

# 쿠버네티스 워크노드에 대한 설정
# The type of the instance.
instance_type = "m5.large"

# mixed_instances에는 위 instance_type 외에 타입을 추가해야 한다.
# mixed 설정이 있을 때, Default instance_type 외에 mixed_instances 타입으로 추가로 생성한다.
mixed_instances = ["m4.large", "r4.large", "r5.large"]

volume_size = "64"
min = "3"
max = "5"

# 쿠버네티스 워크노드에 대한 오토스케일링 그룹 설정, 온 디멘드 EC2 갯수 설정
# Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances.
on_demand_base = "0"

# 쿠버네티스 워크노드에 대한 오토스케일링 그룹 설정, 온 디멘드 EC2 비율 설정
# Percentage split between on-demand and Spot instances above the base on-demand capacity.
on_demand_rate = "0"

# 쿠버네티스 워크 노드(EC2) 접속용 키페어 이름, 미리 생성해 두어야 함!!!
key_name = "SEOUL-SRE-SKC5-EKS"

# AWS 계정을 본인 계정으로 변경해야 함!!! 
map_users = [
  {
    user     = "user/changyu.seon"
    username = "changyu.seon"
    group    = "system:masters"
  },
]

# 소유한 도메인 네임으로 변경해야 함!!!
root_domain = "opsnow.io"

# 가중치 기반 라우팅 정책, 1~255 사이의 값 설정 가능
# https://docs.aws.amazon.com/ko_kr/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-weighted
weighted_routing = 100
