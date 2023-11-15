def solution(cap, n, deliveries, pickups):
    total_distance = 0
    while deliveries or pickups:
        # 현재 위치에서 처리할 수 있는 최대 배달 및 수거
        available_delivery, available_pickup = cap, cap

        # 비어있는 배달 및 수거 상자 제거
        while deliveries and not deliveries[-1]:
            deliveries.pop()
        while pickups and not pickups[-1]:
            pickups.pop()

        # 이동 거리 계산
        if deliveries or pickups:
            total_distance += max(len(deliveries), len(pickups)) * 2

        # 배달 처리
        for i in range(len(deliveries) - 1, -1, -1):
            if available_delivery <= 0:
                break
            deliver = min(deliveries[i], available_delivery)
            deliveries[i] -= deliver
            available_delivery -= deliver

        # 수거 처리
        for i in range(len(pickups) - 1, -1, -1):
            if available_pickup <= 0:
                break
            pick = min(pickups[i], available_pickup)
            pickups[i] -= pick
            available_pickup -= pick

    return total_distance
