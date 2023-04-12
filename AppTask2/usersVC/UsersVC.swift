//
//  UsersVC.swift
//  AppTask2
//
//  Created by Ashu on 28/03/23.
//

import UIKit

class UsersVC: UIViewController {

    @IBOutlet weak var UsersTableView: UITableView!
    var usersviewmodel = UserViewModel()
    var postIDViewModel2 = PostIDViewModel()
    var photosViewModel = PhotosViewModel()
    var photoWithAlbumIdViewModel = AlbumIDViewModel()
    var commentsOnPostsViewModel = CommentsOnPostsViewModel()
    
    //var postUserId = ""
    var usersCommentOnPostId = 0
    var albumUserID = ""
    var checkDidSelect: checkSelect = .userData
    var checkAlbumOrPosts: checkAlbumOrPostsClicked = .posts
    var chkNullOrNot = 7
    // MARK: - varialbles for the comments header title and  description
    var postCommentTitle = ""
    var postCommentDescription = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       // postIDViewModel2.ID = postUserId
        photoWithAlbumIdViewModel.ID = albumUserID
        commentsOnPostsViewModel.id = usersCommentOnPostId
        initialize()
        chkeckdidselect()
       // print("this is post id = \(postId)")
        print("albumID is = \(albumUserID )")
        
        
        // Do any additional setup after loading the view.
    }
    
   
    private func initialize(){
        UsersTableView.delegate = self
        UsersTableView.dataSource = self
     //   UsersTableView.SelectionStyle = .none
//        UsersTableView.rowHeight =
        UsersTableView.estimatedRowHeight = UITableView.automaticDimension
        UsersTableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        //UsersTableView.register(UINib(nibName: "UsersPostsTableCell", bundle: nil), forCellReuseIdentifier: "UsersPostsTableCell")
        UsersTableView.register(UINib(nibName: "PhotosWithIDTableCell", bundle: nil), forCellReuseIdentifier: "PhotosWithIDTableCell")
        UsersTableView.register(UINib(nibName: "CommentsOnPostsCell", bundle: nil), forCellReuseIdentifier: "CommentsOnPostsCell")
       
    }
      
    func chkeckdidselect(){
        switch checkDidSelect{
        case .userData:
           // getpostsIdFromAPI()
            print("-------users posts-----")
        case .album, .Album2:
            getPhotoWithId()
        case .commentOnPost:
            getCommentsOnPosts()
        }
    }
    // MARK: - get data from API
    func getpostsIdFromAPI(){
        Utility.showIndicator()
        postIDViewModel2.getpostsID{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.UsersTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    
    // MARK: - get albumID with photos from API
    func getPhotoWithId(){
        Utility.showIndicator()
        photoWithAlbumIdViewModel.getAlbumID{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                DispatchQueue.main.async {
                    self.UsersTableView.reloadData()
                }
                //self.UsersTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    
    
    // MARK: - comments on the posts function for calling Api
    func getCommentsOnPosts(){
        Utility.showIndicator()
        commentsOnPostsViewModel.getCommentsOnPosts{[weak self] success, Error in
            guard let self = self else {return}
            if success{
                self.UsersTableView.reloadData()
            }else{
                print("error!")
            }
            Utility.hideIndicator()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
// MARK: - extension for tableview cell
extension UsersVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch checkDidSelect{
        case .userData:
//            return postIDViewModel.postsData.count
            print("------user posts count-------")
            return 1
        case .album, .Album2:
            return photoWithAlbumIdViewModel.photosIdData.count
        case .commentOnPost:
            return commentsOnPostsViewModel.commentsOnPostsData.count
            
        
            
        }
    }
    
  
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch checkDidSelect{
        case .album, .Album2:
            let cell = UsersTableView.dequeueReusableCell(withIdentifier: "PhotosWithIDTableCell", for: indexPath) as! PhotosWithIDTableCell
            cell.setAlbumImageData(photoWithAlbumIdViewModel.photosIdData[indexPath.row])
            cell.selectionStyle = .none
            return cell
        case .userData:
            print("----users posts cell for item function call-------")
            return UITableViewCell()
//        case .commentOnPost:
//            let cell = UsersTableView.dequeueReusableCell(withIdentifier: "CommentsOnPostsCell", for: indexPath) as! CommentsOnPostsCell
//            cell.setCommentOnPostData(commentsOnPostsViewModel.commentsOnPostsData[indexPath.row])
//            return cell
        default:
            return UITableViewCell()
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
