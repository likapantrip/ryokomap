function copy_link (){
  console.log("jsファイルの読み込み完了") // 本番環境不具合のため、追記。不具合解消後に行削除
  // アイコンを取得
  const copyIcon = document.getElementById('footer_copy-link-icon');
  console.log(copyIcon) // 本番環境不具合のため、追記。不具合解消後に行削除
  console.log("変数copyIcon取得") // 本番環境不具合のため、追記。不具合解消後に行削除

  // コピーするリンクを取得
  const copyLink = document.getElementById('footer_copy-link-url').innerText;
  console.log(copyLink) // 本番環境不具合のため、追記。不具合解消後に行削除
  console.log("変数copyLink取得") // 本番環境不具合のため、追記。不具合解消後に行削除
  
  if (copyIcon) {
    copyIcon.addEventListener('click', () => {
      console.log("クリックイベント発火") // 本番環境不具合のため、追記。不具合解消後に行削除
      try {
        console.log("try文の開始") // 本番環境不具合のため、追記。不具合解消後に行削除
        // クリップボードにコピー
        // navigator.clipboard.writeText(copyLink)
        setTimeout(async () => await navigator.clipboard.writeText(copyLink));
        console.log("クリップボードにURLをコピー!") // 本番環境不具合のため、追記。不具合解消後に行削除

        // メッセージを取得
        const copyMessage = document.getElementById('footer_copy-link-message');
        console.log(copyMessage) // 本番環境不具合のため、追記。不具合解消後に行削除
        console.log("変数copyMessage取得") // 本番環境不具合のため、追記。不具合解消後に行削除

        // メッセージを表示
        if (copyMessage) {
          console.log("コピー成功したので、メッセージ表示") // 本番環境不具合のため、追記。不具合解消後に行削除
          copyMessage.style.display = 'block';
          setTimeout(() => {
            copyMessage.style.display = 'none';
          }, 2000); // メッセージを2秒後に非表示
          console.log("コピー成功したので、メッセージ表示済み") // 本番環境不具合のため、追記。不具合解消後に行削除
        }
      } catch(e) {
        console.log("tryでエラー発生したので、catch開始") // 本番環境不具合のため、追記。不具合解消後に行削除
        // エラーメッセージを取得
        const errorMessage = e.message
        
        // エラーメッセージを表示
        alert('URLリンクのコピーに失敗しました。'+errorMessage);
        console.log("tryでエラー発生したので、アラート表示済み") // 本番環境不具合のため、追記。不具合解消後に行削除
      }
    })
  }
};

window.addEventListener('turbo:load', copy_link);
window.addEventListener("turbo:render", copy_link);