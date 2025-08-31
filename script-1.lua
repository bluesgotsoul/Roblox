local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Audio settings
local ID = "85561320716543" -- Put the audio you want to play here
local Pitch = 1 -- Change the pitch to what you want (Min: 0.5 | Max: 2)
local Tempo = 1 -- Change the tempo to what you want (Min: 0.5 | Max: 2)
local Speed = 1 -- Change the speed to what you want
local Volume = 1 -- Change the volume to what you want
local Looped = false -- Change to whether or not you want to loop the audio

local TempoChange = 0 + Tempo
local TempoPitchChange = 1 / TempoChange
local VolumeChange = 0 + (Volume / 10)

-- Parent sound to PlayerGui for local playback
local soundParent = player:FindFirstChild("PlayerGui")
if not soundParent then
	soundParent = Instance.new("Folder")
	soundParent.Name = "PlayerGui"
	soundParent.Parent = player
end

local Sound = Instance.new("Sound")
Sound.Parent = soundParent
Sound.SoundId = "rbxassetid://" .. ID

if Pitch ~= 1 then
	local pitch = Instance.new("PitchShiftSoundEffect")
	pitch.Octave = Pitch
	pitch.Parent = Sound
end

if Tempo ~= 1 then
	Sound.PlaybackSpeed = TempoChange
	local TempoPitch = Instance.new("PitchShiftSoundEffect")
	TempoPitch.Octave = TempoPitchChange
	TempoPitch.Parent = Sound
end

if Speed ~= 1 then
	Sound.PlaybackSpeed = Speed
end

if Volume ~= 1 then
	local volume = Instance.new("DistortionSoundEffect")
	volume.Level = VolumeChange
	volume.Parent = Sound
end

task.wait(1)
Sound.Looped = Looped
Sound:Play()


