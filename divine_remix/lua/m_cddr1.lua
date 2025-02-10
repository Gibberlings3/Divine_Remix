function B3ForceSkipPriestMemorization()
    repeat

        local fakeChooseSpellEntry = {
            ["enabled"] = false,
            ["key"] = "B3IMPOSSIBLERESREF",
            ["known"] = false
        }
        chargen.choose_spell[-1] = fakeChooseSpellEntry

        if spellBook == nil then spellBook = {} end
        spellBook[chargen.currentSpellLevelChoice] = {
            ["B3IMPOSSIBLERESREF"] = {
                ["specialist"] = false
            }
        }

        for i = 1, chargen.extraSpells do
            createCharScreen:OnLearnMageSpellButtonClick(-1)
            fakeChooseSpellEntry.enabled = false
        end

        createCharScreen:OnDoneButtonClick()

    until createCharScreen:GetCurrentStep() ~= 13
end