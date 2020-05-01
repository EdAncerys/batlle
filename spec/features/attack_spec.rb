feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Dave attacked Mittens'
  end
end

feature 'Attacking' do
  # 'attack Player 2' scenario omitted

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_link 'Attack'
    click_link 'OK'
    expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end

  # extract to dif spec file
  scenario 'switch turns turns' do
    sign_in_and_play
    click_link 'Attack'
    click_link 'OK'
    expect(page).to have_content "Mittens's turn"
  end

  scenario 'i want to see my hit points' do
    sign_in_and_play
    expect(page).to have_content 'Dave: 60HP'
  end

end