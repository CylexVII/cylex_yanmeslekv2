Jobs = {
    ["Kasap"] = {
        jobRequired = false, --Meslek zorunluluğunu açar
        jobName = "slaughterer", --Meslek isimi
        location = { 
            [1] = { --toplama
                coords = vector3(1183.9167480469,3581.064453125,34.505889892578), --İşlemin yapılacağı kordinat
                blip = {
                    showBlip = true, --Blip'i açar
                    blipName = "Kasap toplama", --Blip adı
                    sprite = 475, --Blip işareti
                    color = 8, --Blip rengi
                    scale = 0.65, --Blip boyutu
                },
                marker = {
                    enable = true, --Marker'ı açar
                    size  = { x = 0.7, y = 0.7, z = 0.4 }, --Marker boyutu
                    color = { r = 255, g = 0, b = 0 }, --Marker rengi
                    type  = 2 --Marker tipi
                },
                draw3dtext = {
                    enable = true, --Drawtexti açar
                    text = "Tavuk toplamak için ~g~E ~w~bas", --Drawtext text'i
                },
                item = {
                    process = "pickup", --Dokunmayın

                    itemName = "alive_chicken", --Toplanacak olan eşya
                    addCount = 1, --Toplama başına verilecek adet
                },                
                animation = {
                    enable = true, --Animasyonu açar
                    animationFunction = function(ped)
                        animDict = "mp_car_bomb" --Animasyonun dict'ini girin
                        animName = "car_bomb_mechanic" --Animasyon adını girin
                        Citizen.CreateThread(function() 
                            RequestAnimDict(animDict) 
                            while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end 
                            TaskPlayAnim(ped, animDict, animName, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end)
                    end,
                },
                progressbar = {
                    enable = true, --progress barı açar
                    progText = "Toplanıyor...", --progress bar'ın texti
                    duration = 5000 --İşlem süresi
                }
            },
            [2] = { --işleme
                coords = vector3(1182.3233642578, 3587.21875, 33.746761322021), 
                blip = {
                    showBlip = true,
                    blipName = "Kasap işleme",
                    sprite = 475, 
                    color = 8,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2
                },
                draw3dtext = {
                    enable = true,
                    text = "Tavuk islemek için ~g~E ~w~bas",
                },
                item = {
                    process = "exchange", --dokunmayın.
                    
                    addCount = 1, --verilecek adet
                    itemName = "slaughtered_chicken", --verilecek olan eşya
                    
                    removeCount = 1, --işlem için gerekli adet
                    requiredItem = "alive_chicken", --işlem için gerekli olan eşya
                },
                animation = {
                    enable = true,
                    animationFunction = function(ped)
                        animDict = "mp_car_bomb"
                        animName = "car_bomb_mechanic"
                        Citizen.CreateThread(function()
                            RequestAnimDict(animDict) 
                            while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
                            TaskPlayAnim(ped, animDict, animName, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end)
                    end,
                },
                progressbar = {
                    enable = true,
                    progText = "İşleniyor...",
                    duration = 5000
                }
            },
            [3] = { --paketleme
                coords = vector3(1180.3918457031, 3591.4223632812, 33.566711425781), 
                blip = {
                    showBlip = true,
                    blipName = "Kasap paketleme",
                    sprite = 475, 
                    color = 8,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2
                },
                draw3dtext = {
                    enable = true,
                    text = "Tavuk paketlemek için ~g~E ~w~bas",
                },
                item = {
                    process = "package", --dokunmayın

                    addCount = 1, --verilecek adet
                    itemName = "packaged_chicken", --verilecek eşya

                    removeCount = 1, --gerekli eşyadan silinecek adet
                    requiredItem = "slaughtered_chicken", --gerekli eşya
                },
                animation = {
                    enable = true,
                    animationFunction = function(ped)
                        animDict = "mp_car_bomb"
                        animName = "car_bomb_mechanic"
                        Citizen.CreateThread(function()
                            RequestAnimDict(animDict) 
                            while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
                            TaskPlayAnim(ped, animDict, animName, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end)
                    end,
                },
                progressbar = {
                    enable = true,
                    progText = "Paketleniyor...",
                    duration = 5000
                }
            },

            [4] = { --satma
                coords = vector3(1177.7438964844, 3592.576171875, 33.646907806396), 
                blip = {
                    showBlip = true,
                    blipName = "Kasap satış",
                    sprite = 475, 
                    color = 8,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2
                },
                draw3dtext = {
                    enable = true,
                    text = "Tavuk satmak için ~g~E ~w~bas",
                },
                item = {
                    process = "sell", --dokunmayın

                    removeCount = 1, --satış için gereken minimum adet
                    requiredItem = "packaged_chicken", --satış için istenilen item
                    price = 100 --verilecek para
                },
                animation = {
                    enable = true,
                    animationFunction = function(ped)
                        animDict = "mp_car_bomb"
                        animName = "car_bomb_mechanic"
                        Citizen.CreateThread(function()
                            RequestAnimDict(animDict) while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
                            TaskPlayAnim(ped, animDict, animName, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end)
                    end,
                },
                progressbar = {
                    enable = true,
                    progText = "Satılıyor...",
                    duration = 5000
                }
            }
        },
    },

    ["Uzum"] = {
        jobRequired = false, --Meslek zorunluluğunu açar
        jobName = "slaughterer", --Meslek isimi
        location = { 
            [1] = { --toplama
                coords = vector3(1196.6663818359, 3584.3239746094, 34.317470550537), --İşlemin yapılacağı kordinat
                blip = {
                    showBlip = true, --Blip'i açar
                    blipName = "Üzüm toplama", --Blip adı
                    sprite = 475, --Blip işareti
                    color = 8, --Blip rengi
                    scale = 0.65, --Blip boyutu
                },
                marker = {
                    enable = true, --Marker'ı açar
                    size  = { x = 0.7, y = 0.7, z = 0.4 }, --Marker boyutu
                    color = { r = 255, g = 0, b = 0 }, --Marker rengi
                    type  = 2 --Marker tipi
                },
                draw3dtext = {
                    enable = true, --Drawtexti açar
                    text = "Üzüm toplamak için ~g~E ~w~bas", --Drawtext text'i
                },
                item = {
                    process = "pickup", --Dokunmayın

                    itemName = "alive_chicken", --Toplanacak olan eşya
                    addCount = 1, --Toplama başına verilecek adet
                },                
                animation = {
                    enable = true, --Animasyonu açar
                    animationFunction = function(ped)
                        animDict = "mp_car_bomb" --Animasyonun dict'ini girin
                        animName = "car_bomb_mechanic" --Animasyon adını girin
                        Citizen.CreateThread(function() 
                            RequestAnimDict(animDict) 
                            while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end 
                            TaskPlayAnim(ped, animDict, animName, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end)
                    end,
                },
                progressbar = {
                    enable = true, --progress barı açar
                    progText = "Toplanıyor...", --progress bar'ın texti
                    duration = 5000 --İşlem süresi
                }
            },
            [2] = { --işleme
                coords = vector3(1195.1020507812, 3590.2385253906, 33.696395874023), 
                blip = {
                    showBlip = true,
                    blipName = "Üzüm işleme",
                    sprite = 475, 
                    color = 8,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2
                },
                draw3dtext = {
                    enable = true,
                    text = "Üzüm islemek için ~g~E ~w~bas",
                },
                item = {
                    process = "exchange", --dokunmayın.
                    
                    addCount = 1, --verilecek adet
                    itemName = "slaughtered_chicken", --verilecek olan eşya
                    
                    removeCount = 1, --işlem için gerekli adet
                    requiredItem = "alive_chicken", --işlem için gerekli olan eşya
                },
                animation = {
                    enable = true,
                    animationFunction = function(ped)
                        animDict = "mp_car_bomb"
                        animName = "car_bomb_mechanic"
                        Citizen.CreateThread(function()
                            RequestAnimDict(animDict) 
                            while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
                            TaskPlayAnim(ped, animDict, animName, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end)
                    end,
                },
                progressbar = {
                    enable = true,
                    progText = "İşleniyor...",
                    duration = 5000
                }
            },
            [3] = { --paketleme
                coords = vector3(1193.0616455078, 3599.1394042969, 33.449207305908), 
                blip = {
                    showBlip = true,
                    blipName = "Üzüm paketleme",
                    sprite = 475, 
                    color = 8,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2
                },
                draw3dtext = {
                    enable = true,
                    text = "Üzüm paketlemek için ~g~E ~w~bas",
                },
                item = {
                    process = "package", --dokunmayın

                    addCount = 1, --verilecek adet
                    itemName = "packaged_chicken", --verilecek eşya

                    removeCount = 1, --gerekli eşyadan silinecek adet
                    requiredItem = "slaughtered_chicken", --gerekli eşya
                },
                animation = {
                    enable = true,
                    animationFunction = function(ped)
                        animDict = "mp_car_bomb"
                        animName = "car_bomb_mechanic"
                        Citizen.CreateThread(function()
                            RequestAnimDict(animDict) 
                            while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
                            TaskPlayAnim(ped, animDict, animName, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end)
                    end,
                },
                progressbar = {
                    enable = true,
                    progText = "Paketleniyor...",
                    duration = 5000
                }
            },

            [4] = { --satma
                coords = vector3(1192.08203125, 3603.9738769531, 33.392375946045), 
                blip = {
                    showBlip = true,
                    blipName = "Üzüm satış",
                    sprite = 475, 
                    color = 8,
                    scale = 0.65,
                },
                marker = {
                    enable = true,
                    size  = { x = 0.7, y = 0.7, z = 0.4 },
                    color = { r = 204, g = 204, b = 0 },
                    type  = 2
                },
                draw3dtext = {
                    enable = true,
                    text = "Üzüm satmak için ~g~E ~w~bas",
                },
                item = {
                    process = "sell", --dokunmayın

                    removeCount = 1, --satış için gereken minimum adet
                    requiredItem = "packaged_chicken", --satış için istenilen item
                    price = 100 --verilecek para
                },
                animation = {
                    enable = true,
                    animationFunction = function(ped)
                        animDict = "mp_car_bomb"
                        animName = "car_bomb_mechanic"
                        Citizen.CreateThread(function()
                            RequestAnimDict(animDict) while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
                            TaskPlayAnim(ped, animDict, animName, 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end)
                    end,
                },
                progressbar = {
                    enable = true,
                    progText = "Satılıyor...",
                    duration = 5000
                }
            }
        },
    },
}